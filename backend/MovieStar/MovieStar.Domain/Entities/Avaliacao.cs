using MovieStar.Domain.Shared.Entities;

namespace MovieStar.Domain.Entities
{
    public sealed class Avaliacao : BaseEntity
    {
        #region Propriedades
        public Guid UsuarioId { get; private set; }
        public Guid? FilmeId { get; private set; }
        public Guid? SerieId { get; private set; }
        public string Comentario { get; private set; }
        public int Nota { get; private set; }
        public DateTime DataAvaliacao { get; private set; }
        #endregion

        #region Construtor
        public Avaliacao(Guid usuarioId, Guid? filmeId, Guid? serieId, string comentario, int nota) : base(Guid.NewGuid())
        {
            UsuarioId = usuarioId;
            FilmeId = filmeId;
            SerieId = serieId;
            Comentario = comentario;
            Nota = nota;
            DataAvaliacao = DateTime.Now;
        }
        #endregion

        #region Métodos
        //Adicionar métodos para manipular as propriedades
        #endregion
    }
}