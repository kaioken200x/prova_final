Cmp.Rastreamento = function() {
    
    var private = {

        render: function() {

            Cmp.createInput({
                id: 'inputPlaca',
                renderTo: '#divInputPlaca',
                label: 'Placa do veículo',
                width: '200px',
                maxlength: '7',
                pattern: '^[a-zA-Z0-9]{0,9}$',
                title: 'A placa deve conter apenas letras e números e ter no máximo 9 caracteres.'
            });
            Cmp.createInput({
                id: 'inputDataInicio',
                renderTo: '#divInputDataInicio',
                label: 'Data de Início',
                type: 'date',
                width: '200px'
            });
            
            Cmp.createInput({
                id: 'inputDataFim',
                renderTo: '#divInputDataFim',
                label: 'Data de Término',
                type: 'date', 
                width: '200px'
            });
            Cmp.createInput({
                id: 'inputnome',
                renderTo: '#divInputnome',
                label: 'Nome Funcionário',
                width: '200px'
            });

            Cmp.createButton({
                id: 'btnBuscar',
                renderTo: '#divBtnConsultar',
                text: 'Buscar',
                handler: function() {
                    private.buscar();
                }
            });
            

            Cmp.createGrid({
                id: 'gridVeiculoAcimaVelocidade',
                renderTo: '#divVeiculoAcimaVelocidade',
                header: [
                    {
                        text: 'Placa',
                        field: 'placa',
                        width: 150
                    },
                    {
                        text: 'Funcionário',
                        field: 'nome',
                        width: 150
                    }, 
                    {
                        text: 'Data',
                        field: 'data',
                        width: 150
                    },
                    {
                        text: 'V.Máxima',
                        field: 'vel_maxima',
                        width: 150
                    },
                    {
                        text: 'V.Registrada',
                        field: 'velocidade_registrada',
                        width: 150
                    },
                    {
                        text: 'Diff. Vel',
                        field: 'percentual_acima',
                        width: 150
                    },
                    {
                        text: 'Latitude',
                        field: 'latitude',
                        width: 150
                    },
                    {
                        text: 'Longitudo',
                        field: 'longitudo',
                        width: 150
                    },
                ]
            });
        },

        buscar: function() {
           
            var data_inicio = Cmp.get('inputDataInicio').getValue();
            var data_fim = Cmp.get('inputDataFim').getValue();
            var placa = Cmp.get('inputPlaca').getValue();
            var nome = Cmp.get('inputnome').getValue();

            var dataInicioObj = new Date(data_inicio);
            var dataFimObj = new Date(data_fim);

            if (data_inicio && data_fim) {
                if (dataInicioObj <= dataFimObj) {

                    Cmp.showLoading();
    
                    Cmp.request({
                        url: 'index.php?mdl=relVeiculoAcimaVelocidade&file=veiculoAcimaVelocidade.php',
                        params: {
                            placa: placa,
                            data_inicio: data_inicio,
                            data_fim: data_fim,
                            nome: nome
                        },
                        success: function(res) {
                            Cmp.hideLoading();
                            if(res.status == 'success') {
                                Cmp.get('gridVeiculoAcimaVelocidade').loadData(res.data);
                            } else {
                                Cmp.showErrorMessage(res.message || 'Ocorreu um erro na requisição');
                            }
                        }
                    });
    
                }else{
                    Cmp.showErrorMessage('Data inicial maior que a final !');

                }
            }else{

                Cmp.showErrorMessage('Data Obrigatória !');
            }
           
        }

    };

    this.init = function() {
        private.render();
    }
}