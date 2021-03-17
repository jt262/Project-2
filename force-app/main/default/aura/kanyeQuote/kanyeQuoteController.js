({
    handleClick : function(component, event, helper){
        
        var attributeValue = component.get("v.quote");
        var quoteObj = new Schema.SOjbect("Inspirational_Kanye_Quote__c");
        
        var target = event.getSource();
        component.set("v.quote", target.get("v.label"));
        
        Database.insert(attributeValue);
        
        
    }
})