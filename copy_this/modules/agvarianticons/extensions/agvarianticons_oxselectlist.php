<?php

class agvarianticons_oxselectlist extends agvarianticons_oxselectlist_parent {

    public function isIconSelectlist () {
        return $this->isVariantIconList('aIconSelections');
    }

    public function isButtonSelectlist () {
        return $this->isVariantIconList('aButtonSelections');
    }

    public function isColorSelectlist () {
        return $this->isVariantIconList('aColorSelections');
    }

    public function isImageSelectlist () {
        return $this->isVariantIconList('aImageSelections');
    }

    public function getCustomDisplayType () {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar('aCustomSelections', null, 'module:agvarianticons');

        return isset($lists[$this->getLabel()]) ? $lists[$this->getLabel()] : '';
    }

    public function getVariantIconDisplayType () {
        if ($this->isIconSelectlist()) {
            return 'icon';
        } elseif ($this->isButtonSelectlist()) {
            return 'button';
        } elseif ($this->isColorSelectlist()) {
            return 'color';
        } elseif ($this->isImageSelectlist()) {
            return 'image';
        } else {
            return $this->getCustomDisplayType();
        }
    }

    public function getSelectionHexColor ($value) {
        if ($this->isColorSelectlist()) {
            $config = oxRegistry::getConfig();
            $map = $config->getShopConfVar('aColorMap', null, 'module:agvarianticons');
            return $map[$value];
        }
    }

    public function getSelectionImagePath ($value) {
        if ($this->isImageSelectlist()) {
            $config = oxRegistry::getConfig();
            $map = $config->getShopConfVar('aImageMap', null, 'module:agvarianticons');
            return $map[$value];
        }
    }

    protected function isVariantIconList ($setting) {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar($setting, null, 'module:agvarianticons');
        return in_array($this->getLabel(), $lists);
    }
}