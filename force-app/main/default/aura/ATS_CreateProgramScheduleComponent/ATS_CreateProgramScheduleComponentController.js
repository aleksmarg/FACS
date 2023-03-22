({
    //cancel button to close quick action
	cancel : function(component, event, helper) {
        helper.closeQuickAction(component, event, helper);
    },
    
    //controller function to create program schedules on confirmation
    saveProgramSchedule : function(component, event, helper) {
        helper.callServerSideMethod(component, event, helper, "ATS_CreateProgramSchedules");
    }
})