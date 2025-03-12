trigger LeadTrigger on Lead (after insert) {
    system.debug('**** LEAD TRIGGER AFTER INSERT ****');
    for(Lead l: Trigger.new) {
    if((l.LeadSource != null)&&(l.LeadSource == 'Web')){
       system.debug('**** WEBTOLEAD LEAD ****');
        WebLeadConvert.convert(Trigger.new);
     }
 }
    
}