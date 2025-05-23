using MovieStar.Domain.Shared.ValueObjects;

namespace MovieStar.Domain.ValueObjects
{
    public class Genero : ValueObject<Genero>
    {
        public string Nome { get; private set; }

        public Genero(string nome, string descricao)
        {
            Nome = nome;
        }

        public void AlterarNome(string nome)
        {
            Nome = nome;
        }
    }
}