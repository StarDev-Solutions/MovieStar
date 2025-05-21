using MovieStar.Domain.Shared.Entities;
using MovieStar.Domain.ValueObjects;

namespace MovieStar.Domain.Entities
{
    public sealed class Filme : BaseEntity
    {
        #region Propriedades
        public string Nome { get; private set; }
        public string Descricao { get; private set; }
        public List<string> Genero { get; private set; }
        public List<Personagem> Elenco{ get; private set; }
        public int Duracao { get; private set; }
        public string Imagem { get; private set; }
        public string Classificacao { get; private set; }
        public string Origem { get; private set; }
        public DateTime DataLancamento { get; private set; }
        public int FaixaEtaria { get; private set; }
        public List<Avaliacao>? Avaliacao { get; private set; }
        #endregion

        #region Construtor
        public Filme(string nome, string descricao, List<string> genero, List<Personagem> elenco, 
            int duracao, string imagem, string classificacao, string origem, 
            DateTime dataLancamento,int faixaEtaria, List<Avaliacao>? avaliacao) : base(Guid.NewGuid())
        {
            Nome = nome;
            Descricao = descricao;
            Genero = genero;
            Elenco = elenco;
            Duracao = duracao;
            Imagem = imagem;
            Classificacao = classificacao;
            Origem = origem;
            DataLancamento = dataLancamento;
            FaixaEtaria = faixaEtaria;
            Avaliacao = avaliacao;
        }
        #endregion

        #region Métodos
        //Adicionar métodos para manipulas as propriedades
        #endregion
    }
}