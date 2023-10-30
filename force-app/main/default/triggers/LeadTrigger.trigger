trigger LeadTrigger on Lead (before insert, after update) {
    
    if(Trigger.isBefore &&Trigger.isInsert){
        for (Lead w:Trigger.new){
            if(string.isBlank(w.Industry)){
                w.addError('You can not leave industry field empty');
            }
        }
        
    }
    if(Trigger.isAfter &&Trigger.isUpdate){
        for (Lead w:Trigger.new){
            if(!(w.Company.equals(Trigger.oldMap.get(w.id)))){
               System.debug('Lead in yeni soyismi: ' + w.LastName);
                System.debug('Lead in eski soyismi: ' + Trigger.oldMap.get(w.Id).LastName);
                
            }
        }
        
    }
    
}