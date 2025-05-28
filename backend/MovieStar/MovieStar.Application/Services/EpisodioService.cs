using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class EpisodioService : IEpisodioService
    {
        public Task AddAsync(EpisodioRequest episodio)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<EpisodioResponse>> GetAllInSeasonAsync(Guid seasonId)
        {
            throw new NotImplementedException();
        }

        public Task<EpisodioResponse> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<EpisodioResponse> GetByNumberInSeasonAsync(int number, Guid seasonId)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(EpisodioRequest episodio)
        {
            throw new NotImplementedException();
        }
    }
}
