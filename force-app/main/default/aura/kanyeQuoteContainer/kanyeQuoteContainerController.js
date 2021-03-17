({
	doInit : function(component, event, helper) {
        
        let callKanye = component.get("c.callKanye")
        
        callKanye.setCallback(this, function(response){
                              
        	component.set('v.quote', response.getReturnValue())
        	console.log(response.getReturnValue())
        		
        });
        
        $A.enqueueAction(callKanye);
		
	}
})