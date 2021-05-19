({getAccountData : function(component){
        //Load the Account data from apex
        var action = component.get("c.getAccounts");
        var toastReference = $A.get("e.force:showToast");
        console.log('RecordID******************'+component.get("v.AccountIDs"));
       action.setParams(
           { Accid : component.get("v.AccountIDs") 
           });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var accountWrapper = response.getReturnValue();
                if(accountWrapper.success){
                    //Setting data to be displayed in table
                    component.set("v.accountData",response.getReturnValue());
                    alert(JSON.stringify(response.getReturnValue()));
                    toastReference.setParams({
                        "type" : "Success",
                        "title" : "Success",
                        "message" : "record is retireved",
                        "mode" : "dismissible"
                    });
                } // handel server side erroes, display error msg from response 
                else{
                    toastReference.setParams({
                        "type" : "Error",
                        "title" : "Error",
                        "message" :"",
                        "mode" : "sticky"
                    }); 
                }
            } // handel callback error 
            else{
                toastReference.setParams({
                    "type" : "Error",
                    "title" : "Error",
                    "message" : 'An error occurred during initialization '+state,
                    "mode" : "sticky"
                });
            }
            toastReference.fire();
        });
        $A.enqueueAction(action);
    }
})