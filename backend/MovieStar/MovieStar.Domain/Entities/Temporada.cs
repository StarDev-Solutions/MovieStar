using MovieStar.Domain.Shared.Entities;
using MovieStar.Domain.ValueObjects;

namespace MovieStar.Domain.Entities
{
    public sealed class Temporada : BaseEntity
    {
        #region Propriedades
        public int Numero { get; private set; }
        public DateTime DataLancamento { get; private set; }
        public List<Episodio> Episodio { get; private set; }
        #endregion

        #region Construtor
        private Temporada() : base(Guid.NewGuid()) { }

        public Temporada(int numero, DateTime dataLancamento, List<Episodio> episodio) : base(Guid.NewGuid())
        {
            Numero = numero;
            DataLancamento = dataLancamento;
            Episodio = episodio;
        }
        #endregion

        #region Métodos
        public void AdicionarEpisodio(Episodio episodio)
        {
            Episodio.Add(episodio);
        }
        #endregion
    }
}