using MovieStar.Application.Contracts.Services;
using MovieStar.Application.DTOs.Request;
using MovieStar.Application.DTOs.Response;
using MovieStar.Domain.Entities;
using MovieStar.Domain.Repositories;

namespace MovieStar.Application.Services
{
    public class AvaliacaoFilmeService : IAvaliacaoFilmeService
    {
        private readonly IAvaliacaoFilmeRepository _avaliacaoRepository;

        public AvaliacaoFilmeService(IAvaliacaoFilmeRepository avaliacaoRepository)
        {
            _avaliacaoRepository = avaliacaoRepository;
        }

        public async Task AddAvaliacaoAsync(AvaliacaoRequest avaliacao)
        {
            await _avaliacaoRepository.AddAsync(new AvaliacaoFilme(
                avaliacao.UsuarioId,
                avaliacao.Id,
                avaliacao.Comentario,
                avaliacao.Nota
            ));
        }

        public async Task DeleteAvaliacaoAsync(Guid id)
        {
            var avaliacao = await _avaliacaoRepository.GetByIdAsync(id);
            if (avaliacao == null)
                throw new Exception("Avaliação não encontrada.");

            await _avaliacaoRepository.DeleteAsync(avaliacao.Id);
        }

        public async Task<AvaliacaoFilmeResponse> GetAvaliacaoByIdAsync(Guid id)
        {
            var avaliacao = await _avaliacaoRepository.GetByIdAsync(id);
            if (avaliacao == null)
                throw new Exception("Avaliação não encontrada.");

            return new AvaliacaoFilmeResponse(avaliacao.Id, avaliacao.UsuarioId, avaliacao.Comentario, avaliacao.Nota, avaliacao.DataAvaliacao, avaliacao.FilmeId);
        }

        public async Task<IEnumerable<AvaliacaoFilmeResponse>> GetAvaliacoesByFilmeIdAsync(Guid filmeId)
        {
            var avaliacoes = await _avaliacaoRepository.GetAllByMovieIdAsync(filmeId);

            if (avaliacoes == null || !avaliacoes.Any())
                return Enumerable.Empty<AvaliacaoFilmeResponse>();

            var response = avaliacoes.Select(a => new AvaliacaoFilmeResponse(a.Id, a.UsuarioId, a.Comentario, a.Nota, a.DataAvaliacao, a.FilmeId));

            return response;
        }

        public async Task<IEnumerable<AvaliacaoFilmeResponse>> GetAvaliacoesByUserIdAsync(Guid userId)
        {
            var avaliacoes = await _avaliacaoRepository.GetAllByUserIdAsync(userId);

            if (avaliacoes == null || !avaliacoes.Any())
                return Enumerable.Empty<AvaliacaoFilmeResponse>();

            var response = avaliacoes.Select(a => new AvaliacaoFilmeResponse(a.Id, a.UsuarioId, a.Comentario, a.Nota, a.DataAvaliacao, a.FilmeId));

            return response;
        }

        public async Task UpdateAvaliacaoAsync(AvaliacaoRequest avaliacao)
        {
            throw new NotImplementedException();
        }
    }
}