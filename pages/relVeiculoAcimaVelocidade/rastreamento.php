
<div class="row titulo">
<b>Veículos acima da velocidade</b>
</div>
<div class="row">
    <div class="col-12">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-3" id="divInputDataInicio"></div>
                <div class="col-md-3" id="divInputDataFim"></div>
                <div class="col-md-3" id="divInputPlaca"></div>
                <div class="col-md-3" id="divInputnome"></div>
            </div>
            <div class="row">
                <div class="col-md-5" id="divBtnConsultar"></div>
            </div>
        </div>

        <div id="divVeiculoAcimaVelocidade"></div>
    </div>
</div>

<style type="text/css">
    .jumbotron {
        padding: 32px;
    }
    .titulo {
        font-size: 30px;
        margin: 8px;
        font-family: inherit;    
    }

    #divInputDataInicio,#divInputDataFim #divInputPlaca,#divInputnome,#divBtnConsultar {
        display: inline-block;
        vertical-align: top;
    }

    #divBtnConsultar{
        margin-top: 32px;
        margin-left: 10px;
        text-align: left;
    }
    #divBtnExportar{
        margin-top: 32px;
        margin-left: 10px;
        text-align: right;
    }

    #divVeiculoAcimaVelocidade {
        display: inline-block;
        width: 100%;
        margin-bottom: 20px;
    }
</style>


<script type="text/javascript">
    Cmp.ready(function() {
        new Cmp.Rastreamento().init();
    });
</script>