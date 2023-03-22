({
    //helper method to call apex methods
    callServerSideMethod : function(component, event, helper, methodName) {
        $A.util.removeClass(component.find("spinnerId"),'slds-hide');
        var action = component.get("c."+methodName);
        
        action.setParams({
            recordId : component.get("v.recordId"),
            preemptionDate : component.get("v.programDate")
        });
        
        action.setCallback(this, function(resp){
            $A.util.addClass(component.find("spinnerId"),'slds-hide');
            var state = resp.getState();
            var result = resp.getReturnValue();
            
            if (state === "SUCCESS") {
                if (methodName === "getScheduleAndPreemptionDetails") {
                    if (result.exceptionFlag) {
                        component.set("v.exceptionFlag",true);
                        var exMessge = result.exceptionMessage;
                        helper.showToastMessage(component, event, helper, "error" ,"Error!", exMessge);
                        helper.closeQuickActionWindow(component, event, helper);
					}
                    else {
                        component.set("v.exceptionFlag",false);
                        component.set("v.rowData", result.rowData);
                        component.set("v.inPatternCount", result.inPatterPercentage);
                        component.set("v.noMGCount", result.noMGPercentage);
                        component.set("v.dateMessage", result.dateMessage);
                        
                        //getting preempted record related details
                        var rowData = result.rowData;
                        var preemptedData = [];
                        for (var key in rowData) {
                            if (rowData[key].isPreempted == true) {
                                preemptedData.push(rowData[key]);
                            }
                            
                        }
                        
                        if (preemptedData.length > 0) {
                        	component.set("v.rowPreemptedData", preemptedData);
                        }
                    }
                }
            } else if (state === "ERROR") {
                component.set("v.exceptionFlag",true);
                var generalErrorMessage = $A.get("$Label.c.ATS_GenericExceptionMessage");
                helper.closeQuickActionWindow(component, event, helper);                        
                helper.showToastMessage(component, event, helper, "error" ,"Error!", generalErrorMessage);
            }
        });
        
        $A.enqueueAction(action);
            
    },
    
    //to close quick actions
    closeQuickActionWindow : function(component, event, helper){
        var closeAction = $A.get("e.force:closeQuickAction");
        closeAction.fire();
    },
    
    //generic function used to display toast messages
    showToastMessage : function(component, event, helper, type, title, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "type": type,
            "title": title,
            "message": message
        });
        toastEvent.fire();
    },
    
    //function to convert object list into csv format
    convertArrayOfObjectsToCSV : function(component,objectRecords){
        // declare variables
        var csvStringResult, counter, keys, columnDivider, lineDivider, colHeader;
        var percentInPatternLabel = $A.get("$Label.c.ATS_ReportInPatternPercentLabel");
        var percentNoMGLabel = $A.get("$Label.c.ATS_ReportNOMGPercentLabel");
        var dateMessage = component.get("v.dateMessage");
        dateMessage = dateMessage.replace(/,/g, "");
        percentInPatternLabel = percentInPatternLabel.replace(" =","");
		percentNoMGLabel = percentNoMGLabel.replace(" =","");
        
        // check if "objectRecords" parameter is null, then return from function
        if (objectRecords == null || !objectRecords.length) {
            return null;
        }
        // store ,[comma] in columnDivider vaiable for separate CSV values and 
        // for start next line use '\n' [new line] in lineDivider varaible  
        columnDivider = ',';
        lineDivider =  '\n';
        
        // in the keys variable store fields API Names as a key 
        // this labels use in CSV file header  
        colHeader = [$A.get("$Label.c.ATS_FOXRepColumnLabel"), 
                     $A.get("$Label.c.ATS_MarketColumnLabel"), 
                     $A.get("$Label.c.ATS_CallLettersColumnLabel"), 
                     $A.get("$Label.c.ATS_DMAColumnLabel"), 
                     $A.get("$Label.c.ATS_USHHPercentColumnLabel"), 
                     $A.get("$Label.c.ATS_TZColumnLabel"), 
                     $A.get("$Label.c.ATS_SaturdayIPColumnLabel"), 
                     $A.get("$Label.c.ATS_IPORMGColumnLabel")];
        keys = ['rep','market','callLetters','dma','usHHPercentage', 'timeZone', 'saturdayInPattern', 'inPatternOrMGTime' ];
        
        csvStringResult = dateMessage + columnDivider + columnDivider + columnDivider + columnDivider + columnDivider + columnDivider;
        csvStringResult += percentInPatternLabel + columnDivider + component.get("v.inPatternCount") + lineDivider;
        csvStringResult += columnDivider + columnDivider + columnDivider + columnDivider + columnDivider + columnDivider;
        csvStringResult += percentNoMGLabel + columnDivider + component.get("v.noMGCount") + lineDivider;
        csvStringResult += colHeader.join(columnDivider);
        csvStringResult += lineDivider;
        
        for(var i=0; i < objectRecords.length; i++){   
            counter = 0;
            
            for(var sTempkey in keys) {
                var skey = keys[sTempkey] ;  
                
                // add , [comma] after every String value,. [except first]
                if(counter > 0){ 
                    csvStringResult += columnDivider; 
                }   
                
                csvStringResult += '"'+ (objectRecords[i][skey] != null ? objectRecords[i][skey] : '')+'"'; 
                
                counter++;
                
            } // inner for loop close 
            csvStringResult += lineDivider;
        }// outer main for loop close 
        
        if (csvStringResult == null){
            return;
        }    
            
		//code for create a temp. <a> html tag [link tag] for downloading the CSV file
		var hiddenElement = document.createElement('a');
		hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csvStringResult);
		hiddenElement.target = '_self';
            
		if (!component.get("v.programDate")) {
            var today = new Date();
            var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
            
		} else {
        	var date = component.get("v.programDate");
        }
        
		hiddenElement.download = 'ClearanceReport_'+date+'.csv'; 
		document.body.appendChild(hiddenElement); 
		hiddenElement.click();        
    }
})