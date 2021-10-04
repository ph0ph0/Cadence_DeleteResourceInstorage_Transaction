import DappyContract from 0xdb3d539e48a805b7

transaction {
    prepare(acct: AuthAccount) {
        let DappyCollection = acct.getCapability<&DappyContract.Admin>(DappyContract.CollectionPublicPath)
        if !DappyCollection.check() {
            acct.unlink(DappyContract.CollectionPublicPath)
            destroy <- acct.load<@AnyResource>(from: DappyContract.CollectionStoragePath)
            destroy <- acct.load<@AnyResource>(from: DappyContract.AdminStoragePath) 
        }
    }
}

