using MovieStar.Domain.Shared.Entities;

namespace MovieStar.Domain.Entities
{
    public sealed class Usuario : BaseEntity
    {
        public string Nome { get; private set; }
        public string Email { get; private set; }
        public string Senha { get; private set; }
        public List<Avaliacao>? Avaliacao { get; private set; }
        public bool Assinante{ get; private set; }
        public string Role { get; private set; }
        public string? Imagem { get; private set; }
        public Usuario(string nome, string email, string senha, 
            List<Avaliacao>? avaliacao, bool assinante, string role, string? imagem) : base(Guid.NewGuid())
        {
            Nome = nome;
            Email = email;
            Senha = senha;
            Avaliacao = avaliacao;
            Assinante = assinante;
            Role = role;
            Imagem = imagem;
        }
    }
}