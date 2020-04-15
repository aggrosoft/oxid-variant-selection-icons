<?php

	class agvarianticons_oxselection extends agvarianticons_oxselection_parent{

		protected $_sIcon;
		protected $_sIcon2;

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
	
	}