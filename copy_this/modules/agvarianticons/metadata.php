<?php

$sMetadataVersion = '1.1';

$aModule = array(
    'id'           => 'agvarianticons',
    'title'        => 'Varianten Icons',
    'description'  => 'Erlaubt die Anzeige von Icons für Varianten in Auswahllisten',
    'version'      => '1.0.1',
    'author'       => 'Aggrosoft GmbH',
    'url'		   => 'http://www.ecomponents.de',
    'extend'      => array(
        'oxvarianthandler' => 'agvarianticons/extensions/agvarianticons_oxvarianthandler',
        'oxvariantselectlist' => 'agvarianticons/extensions/agvarianticons_oxvariantselectlist',
        'oxselectlist' => 'agvarianticons/extensions/agvarianticons_oxselectlist',
        'oxsimplevariant' => 'agvarianticons/extensions/agvarianticons_oxsimplevariant',
        'oxselection' => 'agvarianticons/extensions/agvarianticons_oxselection',
        'oxarticle' => 'agvarianticons/extensions/agvarianticons_oxarticle'
    ),
    'templates'   => array(
        'page/details/inc/selectlists.tpl' => 'agvarianticons/application/views/tpl/page/details/inc/selectlists.tpl',
        'page/details/inc/variantselections.tpl' => 'agvarianticons/application/views/tpl/page/details/inc/variantselections.tpl',
        'widget/product/selectbox-icon.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-icon.tpl'
    ),
    'settings' => array(
        array('group' => 'agvarianticons_main', 'name' => 'aIconSelections', 'type' => 'arr',   'value' => '')
    ),
    'blocks' => array(
        array('template' => 'page/details/inc/productmain.tpl','block'=>'details_productmain_selectlists','file'=>'/views/blocks/details_productmain_selectlists.tpl'),
        array('template' => 'page/details/inc/productmain.tpl','block'=>'details_productmain_variantselections','file'=>'/views/blocks/details_productmain_variantselections.tpl')
    )
);
?>
