using MovieStar.Domain.Shared.ValueObjects;

namespace MovieStar.Domain.ValueObjects
{
    public sealed class Personagem : ValueObject<Personagem>
    {
        public string NomePersonagem { get; private set; }
        public string NomeAtor { get; private set; }
        public string Imagem { get; private set; }

        public Personagem(string nomePersonagem, string nomeAtor, string imagem)
        {
            NomePersonagem = nomePersonagem ?? throw new ArgumentNullException(nameof(nomePersonagem));
            NomeAtor = nomeAtor ?? throw new ArgumentNullException(nameof(nomeAtor));
            Imagem = imagem ?? string.Empty;
        }

        public void AlterarNomePersonagem(string nomePersonagem)
        {
            NomePersonagem = nomePersonagem ?? throw new ArgumentNullException(nameof(nomePersonagem));
        }

        public void AlterarNomeAtor(string nomeAtor)
        {
            NomeAtor = nomeAtor ?? throw new ArgumentNullException(nameof(nomeAtor));
        }

        public void AlterarImagem(string imagem)
        {
            Imagem = imagem ?? string.Empty;
        }
    }
}
