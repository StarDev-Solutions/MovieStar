using MovieStar.Domain.Shared.ValueObjects;

namespace MovieStar.Domain.ValueObjects
{
    public sealed class Episodio : ValueObject<Episodio>
    {
        public int Numero { get; private set; }
        public string Nome { get; private set; }
        public string Descricao { get; private set; }
        public int Duracao { get; private set; }
        public byte[] Imagem { get; private set; }

        public Episodio(int numero, string nome, string descricao, int duracao, byte[] imagem)
        {
            Numero = numero;
            Nome = nome ?? throw new ArgumentNullException(nameof(nome));
            Descricao = descricao ?? string.Empty;
            Duracao = duracao;
            Imagem = imagem ?? Array.Empty<byte>();
        }

        public void AlterarNome(string nome)
        {
            Nome = nome ?? throw new ArgumentNullException(nameof(nome));
        }

        public void AlterarDescricao(string descricao)
        {
            Descricao = descricao ?? string.Empty;
        }

        public void AlterarDuracao(int duracao)
        {
            Duracao = duracao;
        }

        public void AlterarImagem(byte[] imagem)
        {
            Imagem = imagem ?? Array.Empty<byte>();
        }
    }
}