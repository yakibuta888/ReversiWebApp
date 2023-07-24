import express from 'express'
import { GameMySQLRepository } from '../infrastructure/repository/game/gameMySQLRepository'
import { TurnMySQLRepository } from '../infrastructure/repository/turn/turnMySQLRepository'
import { StartNewGameUseCase } from '../application/useCase/startNewGameUseCase'

export const gameRouter = express.Router()

const startNewGameUseCase = new StartNewGameUseCase(
  new GameMySQLRepository(),
  new TurnMySQLRepository()
)

gameRouter.post('/api/games', async (req, res) => {
  await startNewGameUseCase.run()

  res.status(201).end()
})
