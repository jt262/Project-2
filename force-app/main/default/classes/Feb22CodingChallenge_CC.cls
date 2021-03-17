public class Feb22CodingChallenge_CC {
    
    public List<Feb22CodingChallenge_Wrapper> lstWrap {get; set;}
    
    public List<Feb22CodingChallenge_Wrapper> getOppRevByAccount(){
        
        lstWrap = new List<Feb22CodingChallenge_Wrapper>();
        
        List<AggregateResult> ars = [SELECT SUM(ExpectedRevenue) sumRev, Account.Name name FROM Opportunity GROUP BY Account.Name HAVING SUM(ExpectedRevenue) > 0];
        for(AggregateResult ar : ars) {
            lstWrap.add(new Feb22CodingChallenge_Wrapper(ar.get('name').toString(), Double.valueOf(ar.get('sumRev'))));
        }
        
        return lstWrap;
    }
    
    public Feb22CodingChallenge_CC(){
        getOppRevByAccount();
    }

}