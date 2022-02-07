<?php

class agvarianticons_oxselectlist extends agvarianticons_oxselectlist_parent {

    public function isIconSelectlist () {
        return $this->oxselectlist__agdisplaytype->value === 'icon' || $this->isVariantIconList('aIconSelections');
    }

    public function isButtonSelectlist () {
        return $this->oxselectlist__agdisplaytype->value === 'button' || $this->isVariantIconList('aButtonSelections');
    }

    public function isRadioSelectlist () {
        return $this->oxselectlist__agdisplaytype->value === 'radio' || $this->isVariantIconList('aRadioSelections');
    }

    public function isColorSelectlist () {
        return $this->oxselectlist__agdisplaytype->value === 'color' || $this->isVariantIconList('aColorSelections');
    }

    public function isImageSelectlist () {
        return $this->oxselectlist__agdisplaytype->value === 'image' || $this->isVariantIconList('aImageSelections');
    }

    public function getCustomDisplayType () {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar('aCustomSelections', null, 'module:agvarianticons');

        return isset($lists[$this->getLabel()]) ? $lists[$this->getLabel()] : '';
    }

    public function getVariantIconDisplayType () {
        if ($this->oxselectlist__agdisplaytype->value) {
            return $this->oxselectlist__agdisplaytype->value;
        }
        if ($this->isIconSelectlist()) {
            return 'icon';
        } elseif ($this->isButtonSelectlist()) {
            return 'button';
        } elseif ($this->isRadioSelectlist()) {
            return 'radio';
        } elseif ($this->isColorSelectlist()) {
            return 'color';
        } elseif ($this->isImageSelectlist()) {
            return 'image';
        } else {
            return $this->getCustomDisplayType();
        }
    }

    public function getVariantIconDisplayTemplate () {
        $displayType = $this->getVariantIconDisplayType();
        if ($displayType) {
            $utils = oxRegistry::getUtilsView();
            $smarty = $utils->getSmarty();
            $template = "widget/product/selectbox-$displayType.tpl";
            if ($smarty->template_exists($template)) {
                return $template;
            }
        }
    }

    public function getSelectionHexColor ($value) {
        // if ($this->isColorSelectlist()) {
            $config = oxRegistry::getConfig();
            $map = $config->getShopConfVar('aColorMap', null, 'module:agvarianticons');
            return $map[$value];
        // }
    }

    public function getSelectionImagePath ($oSelection) {
        // if ($this->isImageSelectlist()) {
            $config = oxRegistry::getConfig();
            $map = $config->getShopConfVar('aImageMap', null, 'module:agvarianticons');
            return $map[$oSelection->getName()];
        // }
    }

    protected function isVariantIconList ($setting) {
        $config = oxRegistry::getConfig();
        $lists = $config->getShopConfVar($setting, null, 'module:agvarianticons');
        return in_array($this->getLabel(), $lists);
    }
}