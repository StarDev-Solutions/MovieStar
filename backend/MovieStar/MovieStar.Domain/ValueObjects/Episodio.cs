namespace MovieStar.Domain.ValueObjects
{
    public sealed class Episodio
    {
        #region Propriedades
        public int Numero { get; private set; }
        public string Nome { get; private set; }
        public string Descricao { get; private set; }
        public int Duracao { get; private set; }
        public string Imagem { get; private set; }
        #endregion

        #region Construtor
        public Episodio(int numero, string nome, string descricao, int duracao, string imagem)
        {
            Numero = numero;
            Nome = nome;
            Descricao = descricao;
            Duracao = duracao;
            Imagem = imagem;
        }
        #endregion

        #region Métodos
        //Adicionar métodos para manipulas as propriedades
        #endregion
    }
}