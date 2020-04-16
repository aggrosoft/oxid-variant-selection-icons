<?php

class agvarianticons_oxselectlist extends agvarianticons_oxselectlist_parent {

    public function isIconSelectlist () {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar('aIconSelections', null, 'module:agvarianticons');
        return in_array($this->getLabel(), $lists);
    }

    public function isButtonSelectlist () {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar('aButtonSelections', null, 'module:agvarianticons');
        return in_array($this->getLabel(), $lists);
    }
}