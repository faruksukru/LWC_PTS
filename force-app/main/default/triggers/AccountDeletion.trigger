Trigger AccountDeletion on Account (before delete) {
    for (Account w: [SELECT id FROM Account where id in (SELECT AccountId from Opportunity) AND id in :Trigger.old]) {
        Trigger.oldMap.get(w.id).addError('Cannot delete account with related opportunities.');
    }
}