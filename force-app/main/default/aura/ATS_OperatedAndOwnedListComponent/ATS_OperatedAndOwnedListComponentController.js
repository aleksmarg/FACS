({
    //init method
	doInit : function(component, event, helper) {
		//setting column header
        component.set('v.columnHeaders', [
            {label: $A.get("$Label.c.ATS_DMANameLabel"), fieldName: 'dma', type: 'text'},
            {label: $A.get("$Label.c.ATS_AccountNameLabel"), fieldName: 'name', type: 'text'},
            {label: $A.get("$Label.c.ATS_DMARankLabel"), fieldName: 'dmaRank', type: 'text'},
            {label: $A.get("$Label.c.ATS_USHHFieldLabel"), fieldName: 'usTvHhCvg', type: 'text'},
            {label: $A.get("$Label.c.ATS_ParentAccountLabel"), fieldName: 'parentAccount', type: 'text'}
        ]);
            
		//call apex method to get program schedule & preemption data 
		helper.callServerSideMethod(component, event, helper, "getOperatedAndOwnedAccounts");    
    },
	
	//function to export all data            
	exportData : function(component, event, helper) {
        var reportData = component.get("v.rowData");
        
        //calling helper to get data with comma and line breaks
        helper.convertArrayOfObjectsToCSV(component, reportData);   
    },
})