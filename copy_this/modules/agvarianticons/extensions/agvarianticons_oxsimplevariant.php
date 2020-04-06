<?php

class agvarianticons_oxsimplevariant extends agvarianticons_oxsimplevariant_parent {

	public function getIconUrl(){
		return $this->oxarticles__oxicon->value;
	}

}