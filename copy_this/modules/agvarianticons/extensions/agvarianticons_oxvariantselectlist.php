<?php

class agvarianticons_oxvariantselectlist extends agvarianticons_oxvariantselectlist_parent {

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

    public function getVariantIconDisplayType () {
        if ($this->isIconSelectlist()) {
            return 'icon';
        } elseif ($this->isButtonSelectlist()) {
            return 'button';
        } elseif ($this->isColorSelectlist()) {
            return 'color';
        } elseif ($this->isImageSelectlist()) {
            return 'image';
        }
    }

    protected function isVariantIconList ($setting) {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar($setting, null, 'module:agvarianticons');
        return in_array($this->getLabel(), $lists);
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

	public function addIconVariant($sName, $sValue, $blDisabled, $blActive,$sIcon,$sIcon2)
    {
        if (($sName = trim($sName))) {
            $sKey = $sValue;

            // creating new
            if (!isset($this->_aList[$sKey])) {
                $this->_aList[$sKey] = oxNew("oxSelection", $sName, $sValue, $blDisabled, $blActive);
                $this->_aList[$sKey]->setIcon($sIcon);
                $this->_aList[$sKey]->setIcon2($sIcon2);
            } else {

                // overriding states
                if ($this->_aList[$sKey]->isDisabled() && !$blDisabled) {
                    $this->_aList[$sKey]->setDisabled($blDisabled);
                }

                if (!$this->_aList[$sKey]->isActive() && $blActive) {
                    $this->_aList[$sKey]->setActiveState($blActive);
                }
            }

            // storing active selection
            if ($this->_aList[$sKey]->isActive()) {
                $this->_oActiveSelection = $this->_aList[$sKey];
            }
        }
    }

}