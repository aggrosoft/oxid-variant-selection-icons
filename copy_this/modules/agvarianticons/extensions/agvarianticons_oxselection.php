<?php

	class agvarianticons_oxselection extends agvarianticons_oxselection_parent{

		protected $_sIcon;
		protected $_sIcon2;
		protected $_fPrice;

        public function getName() {
            $config = oxRegistry::getConfig();
            if ( $config->getShopConfVar('blHidePriceText', null, 'module:agvarianticons') ) {
                return preg_replace('/(.*) [\+|-]\d*\,\d* .*/m', '$1', parent::getName());
            } else {
                return parent::getName();
            }
        }

		public function setIcon($sIcon){
			$this->_sIcon = $sIcon;
		}

		public function getIcon(){
			return $this->_sIcon;
		}

		public function setIcon2($sIcon2){
			$this->_sIcon2 = $sIcon2;
		}

		public function getIcon2(){
			return $this->_sIcon2;
		}

        public function setPrice($fPrice){
            $this->_fPrice = $fPrice;
        }

        public function getPrice(){
            if ($this->_fPrice) {
                return $this->_fPrice;
            } elseif(preg_match('/.* ([\+|-]\d*\,\d* .*)/', parent::getName(), $matches)) {
                return trim($matches[1]);
            }
        }
	}