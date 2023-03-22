({
	//helper method to call apex methods
    callServerSideMethod : function(component, event, helper, methodName) {
        //show spinner
        $A.util.removeClass(component.find("spinnerId"),'slds-hide');
        var action = component.get("c."+methodName);
        
        //setting parameters
        action.setParams({
            recordId : component.get("v.recordId")
        });
        
        action.setCallback(this, function(resp){
            //hide spinner
            $A.util.addClass(component.find("spinnerId"),'slds-hide');
            var state = resp.getState();
            var result = resp.getReturnValue();
            
            //if state is success
            if (state === "SUCCESS") {
                if (methodName === "getOperatedAndOwnedAccounts") {
                    //show error toast if there is an exception
                    if (result.exceptionFlag) {
                        var exMessge = result.exceptionMessage;
                        helper.showToastMessage(component, event, helper, "error" ,"Error!", exMessge);
                        helper.closeQuickActionWindow(component, event, helper);
					}
                    else {
                        component.set("v.rowData", result.rowData);
                    }
                    
                }
            } else if (state === "ERROR") {
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
        colHeader = [$A.get("$Label.c.ATS_DMANameLabel"),
            		 $A.get("$Label.c.ATS_AccountNameLabel"),
                     $A.get("$Label.c.ATS_DMARankLabel"),
                     $A.get("$Label.c.ATS_USHHFieldLabel"),
                     $A.get("$Label.c.ATS_ParentAccountLabel")
                     ]; 
        keys = ['dma','name','dmaRank','usTvHhCvg','parentAccount'];
        
        csvStringResult = colHeader.join(columnDivider);
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
        hiddenElement.download = 'O_&_O_Accounts.csv'; 
		document.body.appendChild(hiddenElement); 
		hiddenElement.click();        
    }
})