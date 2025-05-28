using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Repositories
{
    public interface IAvaliacaoSerieRepository
    {
        Task<AvaliacaoSerie> GetByIdAsync(Guid id);
        Task<IEnumerable<AvaliacaoSerie>> GetBySerieIdAsync(Guid serieId);
        Task<IEnumerable<AvaliacaoSerie>> GetByUserIdAsync(Guid userId);
        Task AddAsync(AvaliacaoSerie avaliacao);
        Task UpdateAsync(AvaliacaoSerie avaliacao);
        Task DeleteAsync(Guid id);
    }
}
