using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Repositories
{
    public interface IAvaliacaoSerieRepository
    {
        Task<AvaliacaoSerie> GetByIdAsync(Guid id);
        Task<IEnumerable<AvaliacaoSerie>> GetBySerieIdAsync(Guid filmeId);
        Task<IEnumerable<AvaliacaoSerie>> GetByUserIdAsync(Guid userId);
        Task AddAsync(AvaliacaoSerie avaliacao);
        Task UpdateAsync(AvaliacaoSerie avaliacao);
        Task DeleteAsync(int id);
    }
}
