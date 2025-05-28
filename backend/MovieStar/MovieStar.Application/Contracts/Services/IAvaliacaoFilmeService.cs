using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Contracts.Services
{
    public interface IAvaliacaoFilmeService
    {
        Task<AvaliacaoFilmeResponse> GetAvaliacaoByIdAsync(Guid id);
        Task<IEnumerable<AvaliacaoFilmeResponse>> GetAvaliacoesByFilmeIdAsync(Guid filmeId);
        Task<IEnumerable<AvaliacaoFilmeResponse>> GetAvaliacoesByUserIdAsync(Guid userId);
        Task AddAvaliacaoAsync(AvaliacaoRequest avaliacao);
        Task UpdateAvaliacaoAsync(AvaliacaoRequest avaliacao);
        Task DeleteAvaliacaoAsync(Guid id);
    }
}
