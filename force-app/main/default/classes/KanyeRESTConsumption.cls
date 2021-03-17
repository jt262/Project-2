public without sharing class KanyeRESTConsumption {
    
    @AuraEnabled
    public static String callKanye(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.kanye.rest');
        request.setMethod('GET');   
        HttpResponse response = http.send(request);
        
        String quote;
        
        if(response.getStatusCode() == 200){
            Object deserializedResponse = JSON.deserializeUntyped(response.getBody());
            Map<String, Object> respMap = (Map<String, Object>) deserializedResponse;
            
            quote = String.valueOf(respMap.get('quote'));
        }
       
        Inspiring_Kanye_Quote__c obj = new Inspiring_Kanye_Quote__c();
        
        obj.Quote__c = quote;
        
        insert obj;
        
        System.debug(quote);
        return quote;
    }

}