using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class AvaliacaoFilmeService : IAvaliacaoFilmeService
    {
        public Task AddAvaliacaoAsync(AvaliacaoRequest avaliacao)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAvaliacaoAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<AvaliacaoFilmeResponse> GetAvaliacaoByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<AvaliacaoFilmeResponse>> GetAvaliacoesByFilmeIdAsync(Guid filmeId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<AvaliacaoFilmeResponse>> GetAvaliacoesByUserIdAsync(Guid userId)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAvaliacaoAsync(AvaliacaoRequest avaliacao)
        {
            throw new NotImplementedException();
        }
    }
}