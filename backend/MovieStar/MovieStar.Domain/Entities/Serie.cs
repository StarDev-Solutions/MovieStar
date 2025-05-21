using MovieStar.Domain.Shared.Entities;
using MovieStar.Domain.ValueObjects;

namespace MovieStar.Domain.Entities
{
    public sealed class Serie : BaseEntity
    {
        #region Propriedades
        public string Nome { get; private set; }
        public string Descricao { get; private set; }
        public List<string> Genero { get; private set; }
        public List<Personagem> Elenco { get; private set; }
        public string Imagem { get; private set; }
        public string Classificacao { get; private set; }
        public string Origem { get; private set; }
        public int FaixaEtaria { get; private set; }
        public List<Avaliacao>? Avaliacao { get; private set; }
        public List<Temporada> Temporada { get; private set; }
        #endregion

        #region Construtor
        public Serie(string nome, string descricao, List<string> genero, List<Personagem> elenco,
            int faixaEtaria, string imagem, string classificacao, string origem,
             List<Avaliacao>? avaliacao, List<Temporada> temporada) : base(Guid.NewGuid())
        {
            Nome = nome;
            Descricao = descricao;
            Genero = genero;
            Elenco = elenco;
            FaixaEtaria = faixaEtaria;
            Imagem = imagem;
            Classificacao = classificacao;
            Origem = origem;
            Avaliacao = avaliacao;
            Temporada = temporada;
        }
        #endregion

        #region Métodos
        //Adicionar métodos para manipulas as propriedades
        #endregion
    }

}
