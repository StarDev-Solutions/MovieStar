using MovieStar.Domain.Entities;

namespace MovieStar.Domain.Interfaces
{
    public interface IAvaliacaoFilmeRepository
    {
        Task<AvaliacaoFilme> GetAvaliacaoByIdAsync(Guid id);
        Task<IEnumerable<AvaliacaoFilme>> GetAvaliacoesByFilmeIdAsync(Guid filmeId);
        Task<IEnumerable<AvaliacaoFilme>> GetAvaliacoesByUserIdAsync(Guid userId);
        Task AddAvaliacaoAsync(AvaliacaoFilme avaliacao);
        Task UpdateAvaliacaoAsync(AvaliacaoFilme avaliacao);
        Task DeleteAvaliacaoAsync(int id);
    }
}