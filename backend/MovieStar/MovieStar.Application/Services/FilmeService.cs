using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class FilmeService : IFilmeService
    {
        public Task AddAsync(FilmeRequest filme)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FilmeResponse>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FilmeResponse>> GetAllRangeAsync(int skip, int take)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FilmeResponse>> GetByGenreAsync(string genre)
        {
            throw new NotImplementedException();
        }

        public Task<FilmeResponse> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<FilmeResponse> GetByNameAsync(string name)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FilmeResponse>> GetByRatedAsync(int rated)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FilmeResponse>> GetByRatingRangeAsync(double minRating, double maxRating)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FilmeResponse>> GetByReleaseDateRangeAsync(DateTime startDate, DateTime endDate)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(FilmeRequest filme)
        {
            throw new NotImplementedException();
        }
    }
}
