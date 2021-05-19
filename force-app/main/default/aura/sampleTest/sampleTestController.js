({
	onInit : function(component, event, helper) {
        console.log(' onInit Method is working');
		console.log(component.get("v.recordId"));
        component.set("v.AccountIDs",component.get("v.recordId"));
        console.log(component.get("v.AccountIDs"));
        component.set("v.accountColumns",[
            {
                label : 'Name',
                fieldName : 'Name',
                type : 'text',
                sortable : true
            },
            {
                label : 'Account Source',
                fieldName : 'AccountSource',
                type : 'text',
                sortable : true
            },
            {
                label : 'Rating',
                fieldName : 'Rating',
                type : 'text',
                sortable : true
            }
        ]);
        helper.getAccountData(component);
	}
})