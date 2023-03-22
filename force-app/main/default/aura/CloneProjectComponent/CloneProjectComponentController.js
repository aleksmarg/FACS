({
    "clone" : function(cmp) {
        //Disable the button while processing to stop user from resubmitting request
        cmp.set("v.isDisabled", true);
        
        // create a one-time use instance of the cloneProject
        // method in the server-side controller
        var action = cmp.get("c.cloneProj");
        action.setParams({ oldProjectId : cmp.get("v.recordId"), projectName : cmp.get("v.projectName") });

        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {                
                var urlEvent = $A.get("e.force:navigateToURL");
                urlEvent.setParams({
                  "url": "/"+response.getReturnValue(),
                });
                urlEvent.fire();
            }
            else if (state === "INCOMPLETE") {
                alert("From server: " + response.getReturnValue());
                cmp.set("v.isDisabled", false);
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
					alert("An error occured while cloning this project: " + errors[0].message);
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
                cmp.set("v.isDisabled", false);
            }
        });
        $A.enqueueAction(action);
    },
    "doInit" : function(cmp) {
        // create a one-time use instance of the cloneProject
        // method in the server-side controller
        var action = cmp.get("c.init");
        action.setParams({ oldProjectId : cmp.get("v.recordId") });

        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {                
                cmp.set("v.projectName", 'clone '+response.getReturnValue());
                cmp.set("v.isDisabled", false);
            }
            else if (state === "INCOMPLETE") {
                alert("From server: " + response.getReturnValue());
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    }
})