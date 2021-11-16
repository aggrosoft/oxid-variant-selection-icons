<?php

class agvarianticons_installer {
    public function onActivate () {
        $queries = [
            'ALTER TABLE oxselectlist ADD AGDISPLAYTYPE VARCHAR(255) NULL;',
            'ALTER TABLE oxarticles ADD AGDISABLEDCOMBINATIONS TEXT NULL;',
        ];
        foreach ($queries as $query) {
            try {
                \OxidEsales\Eshop\Core\DatabaseProvider::getDb()->execute($query);
            } catch (Exception $e) {
                // ignore duplicate column errors
            }
        }

        $oDbHandler = oxNew(\OxidEsales\Eshop\Core\DbMetaDataHandler::class);
        $oDbHandler->updateViews();

    }
}