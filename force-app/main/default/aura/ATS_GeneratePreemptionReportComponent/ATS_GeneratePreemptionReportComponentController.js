({
    //init method
    doInit : function(component, event, helper) {
        //setting column header
        component.set('v.columnHeaders', [
            {label: $A.get("$Label.c.ATS_FOXRepColumnLabel"), fieldName: 'rep', type: 'text', 
             initialWidth : '100'},
            {label: $A.get("$Label.c.ATS_MarketColumnLabel"), fieldName: 'market', type: 'text'},
            {label: $A.get("$Label.c.ATS_CallLettersColumnLabel"), fieldName: 'callLetters', type: 'text'},
            {label: $A.get("$Label.c.ATS_DMAColumnLabel"), fieldName: 'dma', type: 'text', 
             initialWidth : '100'},
            {label: $A.get("$Label.c.ATS_USHHPercentColumnLabel"), fieldName: 'usHHPercentage', type: 'text', 
             initialWidth : '100'},
            {label: $A.get("$Label.c.ATS_TZColumnLabel"), fieldName: 'timeZone', type: 'text', 
             initialWidth : '100'},
            {label: $A.get("$Label.c.ATS_SaturdayIPColumnLabel"), fieldName: 'saturdayInPattern', type: 'text'},
            {label: $A.get("$Label.c.ATS_IPORMGColumnLabel"), fieldName: 'inPatternOrMGTime', type: 'text', 
             initialWidth : '300'},
        ]);
            
            //call apex method to get program schedule & preemption data 
            helper.callServerSideMethod(component, event, helper, "getScheduleAndPreemptionDetails");    
            
            },
            
	refreshReport : function(component, event, helper) {
        //call apex method to get program schedule & preemption data
		helper.callServerSideMethod(component, event, helper, "getScheduleAndPreemptionDetails");    
	},
    
	//function to export all data            
	exportAllData : function(component, event, helper) {
        var reportData = component.get("v.rowData");
        
        //calling helper to get data with comma and line breaks
        helper.convertArrayOfObjectsToCSV(component, reportData);   
    },
            
    //function to export only preempted data            
	exportPreemptedData : function(component, event, helper) {
        var reportData = component.get("v.rowPreemptedData");
        
        //calling helper to get data with comma and line breaks
        helper.convertArrayOfObjectsToCSV(component, reportData);   
    },
            
    //function to close the quick action
    closeQuickAction : function(component, event, helper){
        helper.closeQuickActionWindow(component, event, helper);
        window.location.reload();    
    },        
})