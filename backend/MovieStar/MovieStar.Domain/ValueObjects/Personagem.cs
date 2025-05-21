namespace MovieStar.Domain.ValueObjects
{
    public sealed class Personagem
    {
        #region Propriedades
        public string NomePersonagem { get; private set; }
        public string NomeAtor { get; private set; }
        public string Imagem { get; private set; }
        #endregion
        
        #region Construtores
        public Personagem(string nomePersonagem, string nomeAtor, string imagem)
        {
            NomePersonagem = nomePersonagem;
            NomeAtor = nomeAtor;
            Imagem = imagem;
        }
        #endregion

        #region Métodos
        #endregion
    }
}