trigger AccountDeletionRelatedContact on Account (before delete) {
    for (Contact w: [Select AccountId From Contact Where AccountId in : Trigger.oldmap.keyset()]){
        Trigger.oldmap.get(w.AccountId).adderror('You can not delete Account with related contatcs');
    }
}