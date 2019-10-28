({
    fetchAccHelper : function(component, event, helper) {
        action.setParams({
            "CaseId": component.get("v.recordId")
        });
        component.set('v.mycolumns', [
            {label: 'Cost per Calendar Month', fieldName: 'Rate_Category__c', type: 'text'},
                {label: 'DE', fieldName: 'DE__c', type: 'text'},
                {label: 'FR', fieldName: 'FR__c', type: 'text'},
                {label: 'ES', fieldName: 'ES__c', type: 'text'},
            	{label: 'IT', fieldName: 'IT__c', type: 'text'},
            	{label: 'UK', fieldName: 'UK__c', type: 'text'}
            ]);
        component.set('v.mycolumnsATM', [
            {label: 'ATM Fee in other currencies', fieldName: 'Rate_Category__c', type: 'text'},
                {label: 'DE', fieldName: 'DE__c', type: 'text'},
                {label: 'FR', fieldName: 'FR__c', type: 'text'},
                {label: 'ES', fieldName: 'ES__c', type: 'text'},
            	{label: 'IT', fieldName: 'IT__c', type: 'text'},
            	{label: 'UK', fieldName: 'UK__c', type: 'text'}
            ]);
        component.set('v.mycolumnsCRC', [
            {label: 'Card Replacement Cost', fieldName: 'Rate_Category__c', type: 'text'},
                {label: 'DE', fieldName: 'DE__c', type: 'text'},
                {label: 'FR', fieldName: 'FR__c', type: 'text'},
                {label: 'ES', fieldName: 'ES__c', type: 'text'},
            	{label: 'IT', fieldName: 'IT__c', type: 'text'},
            	{label: 'UK', fieldName: 'UK__c', type: 'text'}
            ]);
        
        var action = component.get("c.fetchrateCard");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.rcList", response.getReturnValue().ccmRateCard);
                component.set("v.ATMrcList", response.getReturnValue().atmRateCard);
                component.set("v.CRCrcList", response.getReturnValue().crcRateCard);
            }
        });
        $A.enqueueAction(action);
    }
    /*,
    fetchATMHelper : function(component, event, helper) {
        component.set('v.mycolumnsATM', [
            {label: 'ATM Fee in Other Currencies', fieldName: 'Rate_Category__c', type: 'text'},
                {label: 'DE', fieldName: 'DE__c', type: 'text'},
                {label: 'FR', fieldName: 'FR__c', type: 'text'},
                {label: 'ES', fieldName: 'ES__c', type: 'text'},
            	{label: 'IT', fieldName: 'IT__c', type: 'text'},
            	{label: 'UK', fieldName: 'UK__c', type: 'text'}
            ]);
        var action = component.get("c.fetchrateCard");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.rcList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }*/
})