({
    doInit: function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
        var action = component.get("c.BRNIntakeById");
        action.setParams({ "brmIntakeid": component.get("v.recordId") });
         action.setCallback( this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state == "SUCCESS") {
                component.set("v.outputTextValue", response.getReturnValue());
            }
            if (state == "Record Created") {
            }
        });
        $A.enqueueAction(action);
    }
})