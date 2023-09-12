<?php

$where = '';

if(empty($_REQUEST) == false){

    if(!empty($_REQUEST['data_inicio']) and !empty($_REQUEST['data_fim'])) {
        $where .= " and r.data between '".$_REQUEST['data_inicio']." 00:00:00' and '".$_REQUEST['data_fim']." 23:59:59' ";
    }
    if(!empty($_REQUEST['placa'])) {
        $where .= " and v.placa LIKE '%".$_REQUEST['placa']."%'";
    }
    if(!empty($_REQUEST['nome'])) {
        $where .= " and f.nome LIKE '%".$_REQUEST['nome']."%'";
    }

}

$db = new Database();

if($db->connect()) {

    $dados = $db->sqlQueryArray(
        "SELECT
            v.placa,
            f.nome,
            date_format(r.data, '%d/%m/%Y %H:%i:%s') AS data,
            v.vel_maxima,
            r.velocidade_registrada,
            CONCAT(FORMAT(((r.velocidade_registrada - v.vel_maxima) / v.vel_maxima) * 100, 2), '%') as percentual_acima,
            r.latitude,
            r.longitudo
        FROM rastreamento r
        INNER JOIN veiculo v on v.id = r.id_veiculo
        INNER JOIN funcionario f on f.id = r.id_funcionario
        where 1=1 ".$where." and velocidade_registrada > vel_maxima order by r.data desc"
    );  
 
    echo json_encode(array(
        'status' => 'success',
        'data' => $dados
    ));

} else {
    echo json_encode(array(
        'status' => 'failure',
        'message' => 'Erro ao conectar ao banco'
    ));
}