using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class AvaliacaoSerieService : IAvaliacaoSerieService
    {
        public Task AddAsync(AvaliacaoRequest avaliacao)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<AvaliacaoSerieResponse> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<AvaliacaoSerieResponse>> GetBySerieIdAsync(Guid serieId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<AvaliacaoSerieResponse>> GetByUserIdAsync(Guid userId)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(AvaliacaoRequest avaliacao)
        {
            throw new NotImplementedException();
        }
    }
}
