public class WebLeadConvert {            

    public static void convert(List<Lead> zleads) {
    system.debug('**** Webform Lead Convert is converting ****');
    for(Lead objLead : zleads) {
        String contactId = '';
        String accountId = '';
        String cvlRes = '';
        String leadId = objLead.id;              
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(leadId);

        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);   
        lc.setDoNotCreateOpportunity(True);    
        lc.setOverwriteLeadSource(FALSE);
        
        Database.LeadConvertResult lcr ;
        lcr = Database.convertLead(lc);
            system.debug('*****Conversion was success? '+lcr.isSuccess());            
            contactId = lcr.getContactId();
            accountId = lcr.getAccountId();
            system.debug('**** I tried to convert the lead ****');
             system.debug('**** Contact Id: ' + contactId + 'Account Id: ' + accountId  + '****');
        
        if(lcr.isSuccess()) {
            Opportunity newOpp = new Opportunity();
            newOpp.Name = 'Automated Webform Enterprise Opportunity for ' + accountId;
            newOpp.CloseDate = System.today() + 90;
            newOpp.StageName = 'New';
            newOpp.AccountId = accountId;
            newOpp.LeadSource = 'Web';
            
            
            insert newOpp;
        
        }
       
        }
            }   
}