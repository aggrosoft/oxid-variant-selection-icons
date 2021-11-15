<?php

class agvarianticons_installer {
    public function onActivate () {
        $query = 'ALTER TABLE oxselectlist ADD AGDISPLAYTYPE VARCHAR(255) NULL;';
        try {
            \OxidEsales\Eshop\Core\DatabaseProvider::getDb()->execute($query);
            $oDbHandler = oxNew(\OxidEsales\Eshop\Core\DbMetaDataHandler::class);
            $oDbHandler->updateViews();
        } catch (Exception $e) {
            // ignore duplicate column errors
        }

    }
}