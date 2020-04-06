<?php

class agvarianticons_oxvariantselectlist extends agvarianticons_oxvariantselectlist_parent {

    public function isIconSelectlist () {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar('aIconSelections', null, 'module:agvarianticons');
        return in_array($this->getLabel(), $lists);
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