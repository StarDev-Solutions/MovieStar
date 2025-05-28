using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;

namespace MovieStar.Application.Services
{
    public class TemporadaService : ITemporadaService
    {
        public Task AddAsync(TemporadaRequest temporada)
        {
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid temporadaId)
        {
            throw new NotImplementedException();
        }

        public Task<TemporadaResponse> GetByIdAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<TemporadaResponse> GetByNumberSeriesAsync(int number, Guid seriesID)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<TemporadaResponse>> GetBySeriesAsync(Guid seriesID)
        {
            throw new NotImplementedException();
        }

        public Task UpdateAsync(TemporadaRequest temporada)
        {
            throw new NotImplementedException();
        }
    }
}
