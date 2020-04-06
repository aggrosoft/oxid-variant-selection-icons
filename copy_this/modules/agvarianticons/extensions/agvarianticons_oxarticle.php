<?php

class agvarianticons_oxarticle extends agvarianticons_oxarticle_parent {

	protected function _isInList()
    {
        return false; //Load full variants in list so we can show icons
    }

}