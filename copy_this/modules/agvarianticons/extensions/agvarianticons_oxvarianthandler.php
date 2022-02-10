<?php

use OxidEsales\Eshop\Core\Registry;

class agvarianticons_oxvarianthandler extends agvarianticons_oxvarianthandler_parent {

    protected $amount = 1;

    public function setAmount($amount) {
        $this->amount = $amount;
    }

    public function getAmount() {
        return $this->amount;
    }

	//Added Icon Url
	protected function _fillVariantSelections($oVariantList, $iVarSelCnt, &$aFilter, $sActVariantId)
    {
        $aSelections = array();

        // filling selections
        foreach ($oVariantList as $oVariant) {

            $aNames = $this->_getSelections($oVariant->oxarticles__oxvarselect->getRawValue());
            $blActive = ($sActVariantId === $oVariant->getId()) ? true : false;
            $sIcon = $oVariant->getIconUrl();
            $sIcon2 = $oVariant->getIconUrl(2);
            $oPrice = $oVariant->getPrice($this->getAmount());
            $fPrice = $oPrice->getPrice();

            for ($i = 0; $i < $iVarSelCnt; $i++) {
                $sName = isset($aNames[$i]) ? trim($aNames[$i]) : false;
                if ($sName) {
                    $sHash = md5($sName);

                    // filling up filter
                    if ($blActive) {
                        $aFilter[$i] = $sHash;
                    }

                    $aSelections[$oVariant->getId()][$i] = array('name' => $sName, 'icon' => $sIcon, 'icon2' => $sIcon2, 'price' => $fPrice, 'disabled' => null, 'active' => false, 'hash' => $sHash);
                }
            }
        }
        return $aSelections;
    }

    protected function _buildVariantSelectionsList($aVarSelects, $aSelections)
    {
        // creating selection lists
        foreach ($aVarSelects as $iKey => $sLabel) {
            $aVariantSelections[$iKey] = oxNew("oxVariantSelectList", $sLabel, $iKey);
        }

        // building variant selections
        foreach ($aSelections as $aLineSelections) {
            foreach ($aLineSelections as $oPos => $aLine) {
                $aVariantSelections[$oPos]->addIconVariant($aLine['name'], $aLine['hash'], $aLine['disabled'], $aLine['active'], $aLine['icon'], $aLine['icon2'], $aLine['price']);
            }
        }

        return $aVariantSelections;
    }

    protected function isPriceViewModeNetto()
    {
        $blResult = (bool) Registry::getConfig()->getConfigParam('blShowNetPrice');
        $oUser = $this->getUser();
        if ($oUser) {
            $blResult = $oUser->isPriceViewModeNetto();
        }

        return $blResult;
    }

}